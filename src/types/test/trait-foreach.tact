primitive Int;
trait BaseTrait { }

trait TraitWithForeach {
    m: map<Int, Int>;

    fun test() { foreach(_, _ in self.m) { } }
}


contract Test with TraitWithForeach {
    m: map<Int, Int>;
}
