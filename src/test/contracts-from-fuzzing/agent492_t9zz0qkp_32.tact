fun foo( /* nothing */ ) : Int { return 1; }
contract T { receive(){ foo(); } }