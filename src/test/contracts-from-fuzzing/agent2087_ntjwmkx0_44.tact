struct OptionalStringHolder {
    s: String?;
}

contract TestOptString {
    f: OptionalStringHolder;

    init() {
        self.f = OptionalStringHolder{s:null};
    }
}