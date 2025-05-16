struct OptionHolder {
    opt: Int?;
}

contract OptionalFieldTest {
    receive() {
        let a = OptionHolder{ opt: 55 };
        let b = OptionHolder{ opt: null };
        // Accessing an optional field
        let valA = a.opt;
        let valB = b.opt;
    }
}
