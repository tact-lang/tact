contract BounceTest_RawSlice2 {
  bounced(rawMsg: Slice) {
    // Use Slice.asString() to convert to string
    let s: String = rawMsg.asString();
  }
}
