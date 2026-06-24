message Simple {
    value: Int;
}

contract TestContract {
    init() {
        send(SendParameters{
            to: myAddress(),
            value: 0,
            mode: 64,
            body: Simple{value: 1}.toCell()
        });
    }
    receive() {

    }
}