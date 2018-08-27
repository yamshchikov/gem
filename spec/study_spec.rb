
RSpec.describe Study do
  it 'receives integer value' do
    config = Study::Config.build do 
      value 1
    end
    expect(config.value).to eq(1)
  end

  it 'receives string value' do
    config = Study::Config.build do 
      value '1'
    end
    expect(config.value).to eq('1')
  end

  it 'receives tree' do
    config = Study::Config.build do 
      tree do
        node do
          value 3
        end
        leaf 555
        another_node do
          subnode do
            another_value 'str'
          end
          another_leaf 'leaf'
        end
      end
    end
    expect(config.tree.node.value).to eq(3)
    expect(config.tree.leaf).to eq(555)
    expect(config.tree.another_node.subnode.another_value).to eq('str')
    expect(config.tree.another_node.another_leaf).to eq('leaf')
  end

  it 'return error for empty block' do
    expect(Study::Config.build).to raise_error ArgumentError
  end

  it 'return NoMethodError for undefined values' do
    config = Study::Config.build do 
      value 313
    end
    expect(config.val).to raise_error(NoMethodError)
  end
end
