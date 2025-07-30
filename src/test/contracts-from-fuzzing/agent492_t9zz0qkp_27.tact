fun foo() : Int { return 1 }
contract T { receive(){ foo(); } }