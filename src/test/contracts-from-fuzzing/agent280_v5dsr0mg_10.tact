struct HasOptional {
    data: Int?;
}

contract OptFieldNoInit {
    f: HasOptional;

    init() {
        self.f = HasOptional{ data: null };
    }
}