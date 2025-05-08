message M1 {}

message M2 {
    field: M1;
}

contract Test {
    receive() {
        let m: M2 = M2 { field: M1 {} };
    }
}