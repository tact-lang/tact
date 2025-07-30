struct HasOptional {
    foo: Int?;
    bar: Bool?;
}

contract OptionalStructField {
    holder: HasOptional = HasOptional{foo: null, bar: null};

    receive() {
        self.holder = HasOptional{foo: 10, bar: true};
    }
}