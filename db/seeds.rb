User.destroy_all

ayana = User.create(name: "Ayana", email: "ayana@ayana.com", image_url: "https://avatars1.githubusercontent.com/u/892860?s=460&v=4", bio: "i love art", password: "pw")

jen = User.create(name: "Jen", email: "jennifer@jennifer.com", image_url: "https://avatars0.githubusercontent.com/u/10600568?s=460&v=4", bio: "i love art", password: "pw")

Post.create(title: "“Heliconia, Crab’s Claw Ginger” (1939)", image_url: "https://static01.nyt.com/images/2018/05/25/arts/25okeeffe1/merlin_138355539_c1e05027-c260-4c88-81c4-5133955a4aba-articleLarge.jpg?quality=75&auto=webp&disable=upscale", description: "A little-known chapter in the career of one of this country’s most famous artists, O’Keeffe’s Hawaiian sojourn takes center stage this spring at the New York Botanical Garden in Georgia O’Keeffe: Visions of Hawai’i.", user_id: jen.id)

Post.create(title: "Hibiscus with Plumeria (1939)", image_url: "https://news.artnet.com/app/news-upload/2018/01/NYBG_Georgia_OKeeffe_Hibiscus-761x1024.jpg", description: "A little-known chapter in the career of one of this country’s most famous artists, O’Keeffe’s Hawaiian sojourn takes center stage this spring at the New York Botanical Garden in Georgia O’Keeffe: Visions of Hawai’i.", user_id: jen.id)

Post.create(title: "Ultra Blue, 2013", image_url: "https://media.mutualart.com/Images/2018_02/18/17/173536306/4c08f002-a43f-4d82-81bc-87d4eb72a857_570.Jpeg", description: "Collage and ink on paper. Dimensions: 29 1/2 × 21 3/5 in", user_id: ayana.id)
