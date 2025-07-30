message Data {
    x: Int;
}

message Wrapped {
    inner: Data?;
}

contract Test {
    receive() {
        let w1 = Wrapped{inner: Data{x:1}};
        let w2 = Wrapped{inner: null};
    }
}