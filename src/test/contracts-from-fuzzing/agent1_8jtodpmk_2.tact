struct Level1 { a: Int; }
struct Level2 { b: Level1; }

contract TestContract {
    receive() {
        let test = Level2{b: Level1{a:1}};
    }
}