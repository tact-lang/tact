struct Data {
    value: Int;
}

struct Wrapper {
    d: Data?;
}

contract Test5 {
    // State variable initialized with a Wrapper containing a null Data
    w: Wrapper = Wrapper{ d: null };

    receive() {}

    // Getter function returning an optional composite type
    get fun getOptionalData(): Data? {
        return self.w.d;
    }
}
