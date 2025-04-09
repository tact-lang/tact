struct Pair { a: Int; b: Int; }

fun complexPaths(x: Int): Int {
    if (x < 0) {
         return -x;
    } else if (x == 0) {
         return 0;
    } else {
         repeat (3) {
             if (x > 10) {
                 return x * 2;
             }
         }
         // if no early return triggered, use a ternary expression
         return x > 5 ? x + 1 : x - 1;
    }
}

contract GetterTest2 {
    // Getter function returning a struct, with both branches explicitly returning a value
    get fun getPair(flag: Bool): Pair {
         if (flag) {
             return Pair{ a: 10, b: 20 };
         } else {
             return Pair{ a: 30, b: 40 };
         }
    }
}

message Msg { value: Int; }

contract ReceiverTest2 {
    // Receiver function, allowed only to accept a valid message type and no return value
    receive(msg: Msg) {
         if (msg.value == 100) {
             return; // early exit
         } else {
             dump(msg.value);
         }
    }
}

asm fun asmRet(x: Int): Int { DUP }

fun asmWrapper(x: Int): Int {
   return asmRet(x) + 3;
}

fun main() {
    let cp = complexPaths(15);
    let cp2 = complexPaths(2);
    let aw = asmWrapper(10);
    dump(cp);
    dump(cp2);
    dump(aw);
    
    // Note: GetterTest2 and ReceiverTest2 are not directly callable from main
}
