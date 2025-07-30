contract TestConstReceiver2 {
    const Y: Int = 7;
    receive() {
         let a: Int = self.Y;
    }
}
