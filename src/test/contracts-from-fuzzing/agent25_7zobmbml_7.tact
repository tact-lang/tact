message MyMessage {
  x: Int;
}

contract BounceConflict {
  // Typed bounce receiver for MyMessage
  bounced(msg: bounced<MyMessage>) {
    // Do nothing
  }

  // Fallback bounce receiver handling raw Slice
  bounced(rawMsg: Slice) {
    // Convert the raw message to a string as a dummy operation
    let s: String = rawMsg.asString();
  }
}
