// Optional contract field directly assigned a struct with some initialized optional
struct SOptional {
    foo: Int?;
    bar: Bool;
}

contract OptInit {
    val: SOptional?;

    init() {
        self.val = SOptional{ foo: null, bar: true };
    }
}