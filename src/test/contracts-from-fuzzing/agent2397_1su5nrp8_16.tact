struct MessageLike {
    text: String;
}

struct Container {
    m1: MessageLike;
    m2: MessageLike;
    m3: MessageLike;
}

contract ManyStructFields {
    state: Container = Container{
        m1: MessageLike{text:"one"},
        m2: MessageLike{text:"two"},
        m3: MessageLike{text:"three"}
    };
    receive() {}
}