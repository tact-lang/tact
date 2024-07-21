@name(iDoNotExist)
native youDo();

contract Test {
   get fun test() {
       youDo();
   }
}