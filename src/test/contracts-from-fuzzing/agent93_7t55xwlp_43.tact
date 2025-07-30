message(41) KnownMessage { a: Int }

struct WrapOptMsg {
    m: KnownMessage?;
}

contract OptionalMessageField {
    f: WrapOptMsg = WrapOptMsg{ m: null };
}