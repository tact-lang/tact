asm fun simpleAsm(): Int { 42 INT }

contract AssemblyTest {
    receive() {
         let res: Int = simpleAsm();
         dump(res);
    }
}
