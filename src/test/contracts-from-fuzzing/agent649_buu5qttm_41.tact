contract DoubleOptionalInit {
    a: Int?;
    b: String?;
    receive() {
        let _ = self.a;
    }
}