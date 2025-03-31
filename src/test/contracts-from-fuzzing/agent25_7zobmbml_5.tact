message MyMessage {
  x: Int;
}

contract BounceChain {

  // bounced receiver handling bounced messages of type MyMessage
  bounced(msg: bounced<MyMessage>) {
    // In a bounce event, reply with a comment
    self.reply("Bounced received".asComment());
  }

  // A receive function that triggers sending a bounceable message to self
  receive("trigger") {
    send(SendParameters{
      to: myAddress(),
      value: 0,
      bounce: true,
      body: MyMessage{ x: 123 }.toCell()
    });
  }
}
