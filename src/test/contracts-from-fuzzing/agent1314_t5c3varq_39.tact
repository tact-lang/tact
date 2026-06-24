contract OptionalSerialize {
    small: Int? as uint8;
    mid: Int? as int32;

    init() {
        self.small=null;
        self.mid=null;
    }
}