primitive Int;
primitive Bool;

struct Point {
    
}

contract Main {
    a: Int;
    init(a: Int) {
        self.a = a;
    }

    get fun hello(): Int {
        return 0;
    }
    get fun hello2(): Point {
        return 0;
    }
}