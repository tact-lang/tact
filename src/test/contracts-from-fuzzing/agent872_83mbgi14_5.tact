struct NonTriv {
    b: Bool = true;
    s: String = "";
    opt: Address?;
}

contract InitDefaults {
    s: NonTriv = NonTriv{};
}