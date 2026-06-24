contract TestConstInt {
    // Valid constant declaration using capitalized 'Int' type and usage with self.X
    const X: Int = 3 + 4;

    receive() {
        let y: Int = self.X * 2;
    }
}
