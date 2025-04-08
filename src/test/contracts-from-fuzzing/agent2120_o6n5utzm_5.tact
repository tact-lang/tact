struct MidStruct { s1: String; optInt: Int?; flag: Bool; }

contract OptionalAndString {
    mid: MidStruct?;
    init() {
        self.mid = null;
    }
}