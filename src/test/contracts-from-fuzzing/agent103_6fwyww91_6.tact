fun pair(_: Int, _: Int): Int { 
    return 0; 
}

contract Test {
   receive() { 
       pair(1,2); 
   }
}
