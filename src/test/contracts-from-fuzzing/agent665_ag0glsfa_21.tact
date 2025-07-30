struct HasEmptyString {
  s: String = "";
}

contract EmptyStringDefault {
    f: HasEmptyString = HasEmptyString{};

    init() {
        self.f = self.f;
    }

    receive() {
        let _ = self.f;
    }
}