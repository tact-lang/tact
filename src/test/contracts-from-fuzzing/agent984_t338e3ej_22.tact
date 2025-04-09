message(1) M {}

struct HasMessage {
    m: M;
    mo: M?;
}

contract StoreMsg {
    d: HasMessage = HasMessage{
        m: M{}, mo: null
    };
}