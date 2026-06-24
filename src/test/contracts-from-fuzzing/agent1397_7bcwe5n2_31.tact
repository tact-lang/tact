struct Info {
    id: Int;
    note: String;
}

contract TestContract {
    a: Info? = null;
    b: Info? = null;

    receive() {
        let _ = self.a;
        let _ = self.b;
    }
}