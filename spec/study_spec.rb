
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
      end
    end
    expect(config.tree.node.value).to eq(3)
    expect(config.tree.leaf).to eq(555)
  end

  it 'return error for empty block' do
    expect(Study::Config.build).to raise_error(NameError)
  end
end
