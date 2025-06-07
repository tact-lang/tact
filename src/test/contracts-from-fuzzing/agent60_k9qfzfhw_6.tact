contract TestConstDependence2 {
    const A: Int = 10;
    const B: Int = self.A + 2;

    receive() {
        let r: Int = self.B;
    }
}
