describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '11111', :from => "3203226011")
    expect(message.save).to eq false
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '11111', :from => "3203226011")
    message.save
    message.errors[:base].should eq ["The 'To' number 11111 is not a valid phone number."]
  end
end
