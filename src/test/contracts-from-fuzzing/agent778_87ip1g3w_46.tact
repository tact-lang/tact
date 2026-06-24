struct AliasOptional {
    b: Int? as int64;
}

contract AliasOptStruct {
    val: AliasOptional;
    init() { self.val = AliasOptional{ b: null }; }
}