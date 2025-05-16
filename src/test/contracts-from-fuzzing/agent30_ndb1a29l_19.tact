message M1 {}
message M2 {}

contract TestContract {
    receive(msg: M1) {}
    receive(msg: M2) {}
}