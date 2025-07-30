struct SI {
    a: Int?;
}

contract OptStructDefault {
    f: SI? = null;

    init() {
        self.f = SI{
            a: null
        };
    }
}