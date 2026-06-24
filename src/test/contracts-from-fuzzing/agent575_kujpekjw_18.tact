message(555) UserEvent {
    details: String;
}

contract NullableMsgField {
    ev: UserEvent?;

    init() {
        self.ev = null;
    }
}