extends fun double(self: Int): Int {
    return self + self;
}

contract ExtensionTest() {
    fun test() {
         let a: Int = 5;
         let b: Int = a.double();
         dump(b); // expected output: 10
    }
    
    fun main() {
         self.test();
    }
}

contract Dummy() {}