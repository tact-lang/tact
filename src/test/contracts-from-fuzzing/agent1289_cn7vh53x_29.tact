struct HasFields {
    a: Int;
    b: Int?;
}

contract DefaultOptInit {
    rec: HasFields;

    init() {
        self.rec = HasFields{ a:5, b:null };
    }
}
