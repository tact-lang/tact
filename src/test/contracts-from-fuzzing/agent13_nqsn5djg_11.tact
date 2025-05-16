contract Test {
    text: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Praesent vel turpis tristique, consectetur risus ut, vulputate nulla. 
Sed fermentum blandit nisi, vel posuere metus gravida vitae. 
Morbi non maximus augue. Etiam sodales massa quis tortor consequat, ac dignissim mauris consequat. 
Donec convallis sapien lobortis, elementum augue congue, volutpat nisl. Quisque consectetur, nulla eu ultrices aliquet, lacus tortor molestie arcu, id facilisis est erat vel lacus. 
Aenean ultricies massa eget nulla auctor, id placerat quam consequat. In placerat magna a tortor fermentum, non dignissim elit pharetra. Aenean hendrerit efficitur leo a malesuada.";

    receive() {
        dump(self.text);
    }
}