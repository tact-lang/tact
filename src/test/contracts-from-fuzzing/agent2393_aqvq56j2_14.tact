struct Compose {
    x: Int;
    y: Int?;
    s: String;
    o: String?;
}

contract ComposeStore {
    c: Compose = Compose{ x:1, y: null, s: "str", o: null };
}