struct Data { value: Int }

contract TestFieldAccess {
    receive() {
        let d: Data = Data { value: 100 };
        let v: Int = d.value;
    }
}
