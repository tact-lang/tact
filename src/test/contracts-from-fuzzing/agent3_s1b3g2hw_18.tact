struct Data {
    x: Int;
}

contract Test {
    receive() {
        let p: Data = Data{x:1};
        let q: Data = Data{x:2};
        if (true) {
            p = q; // test assignment between structs
        }
    }
}