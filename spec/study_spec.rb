RSpec.describe Study do
  it "has a version number" do
    expect(Study::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  it 'return true always' do
    expect(true).to eq(true)
  end
end
