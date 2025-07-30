struct WithOptionalInner {
    inn: Int?;
}

contract AssignNone {
    f: WithOptionalInner;

    init() {
        self.f = WithOptionalInner{ inn: null };
    }
}