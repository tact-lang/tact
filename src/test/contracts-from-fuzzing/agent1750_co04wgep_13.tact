struct Info {
    msg: String;
    emoji: String;
    escaped: String;
}

contract TestContract {
    info: Info = Info{
        msg: "Hello, world!",
        emoji: "🚀🌕",
        escaped: "Line1\nLine2\tTabbed\"Quote\"",
    };

    init() {}
}