contract MixedSerialization {
    x: Int as uint8 = 5;
    y: Int as int64 = -1234;
    z: Int = 99999;
    flag: Bool = true;
    text: String = "serialization";
    opt: Int? = null;
}