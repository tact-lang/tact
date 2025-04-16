message(1) Ping {
    nonce: Int = 42;
}

contract PersistMessage {
    latestPing: Ping = Ping{};
}