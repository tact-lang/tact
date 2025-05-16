struct Composite {
    a: Int;
    b: Int;
}

contract Test2 {
    // State variable of composite type
    state: Composite = Composite{ a: 1, b: 2 };

    receive () {}

    // Getter function returning a composite struct
    get fun getComposite(): Composite {
        return self.state;
    }
}
