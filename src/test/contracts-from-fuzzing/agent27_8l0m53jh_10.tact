contract Test7 {
    // Optional state variable not explicitly initialized, should default to null
    x: Int?;
    receive() {}

    // Getter returning an optional state variable
    get fun getOptional(): Int? {
        return self.x;
    }
}
