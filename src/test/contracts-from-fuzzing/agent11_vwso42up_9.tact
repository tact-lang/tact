contract OptionalGetter {
    // Persistent state variable, optional Int, explicitly initialized to null
    opt: Int?;

    // Initialize state variable in constructor
    init() {
        self.opt = null;
    }

    receive() {}

    // Getter function that returns opt
    get fun get_opt() : Int? {
        return self.opt;
    }
}
