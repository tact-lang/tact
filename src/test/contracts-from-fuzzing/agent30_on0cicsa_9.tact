contract Test {
  receive() {
    let x = ascii("\u{10FFFF}")
  }
}