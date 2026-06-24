struct OptionalHolder {
    maybeVal: Int?;
    maybeAnother: Bool?;
}

contract WithOptionals {
    opt: OptionalHolder;

    init() {
        self.opt = OptionalHolder{
            maybeVal: null,
            maybeAnother: true
        };
    }
}