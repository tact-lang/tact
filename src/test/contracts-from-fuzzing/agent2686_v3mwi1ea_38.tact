struct SerializeOptional {
    a: Int? as uint32;
    b: Int? as int64;
}

contract SerializeOptionalC {
    val: SerializeOptional;

    init() {
        self.val = SerializeOptional{
            a: 4294967295,
            b: -9223372036854775808
        };
    }
}
