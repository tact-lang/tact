struct DeepOpt {
    a: Int?;
    b: Bool?;
    c: String = "hi";
}

contract TestContract {
    data: DeepOpt?;
    receive() { let _ = self.data; }
}