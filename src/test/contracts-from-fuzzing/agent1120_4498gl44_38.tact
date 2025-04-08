struct HasNullableString {
    val: String?;
}

contract NullableString {
    data: HasNullableString;
    init() {
        self.data = HasNullableString{val:null};
    }
}