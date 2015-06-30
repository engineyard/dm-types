shared_examples "identity function" do
  it "returns value unchanged" do
    @result.should == @input
  end
end
