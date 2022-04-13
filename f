Belirli bir altkomut üzerine okumak için 'git help <komut>' kullanın

Ana Komutlar
   add                  Dosya içeriğini indekse ekle
   am                   Bir posta kutusundan bir dizi yama uygula
   archive              Ad verilmiş ağaçtan bir dosyalar arşivi oluştur
   bisect               Hatalara neden olan işlemeyi bulmada ikili arama kullan
   branch               Dal oluştur, sil veya listele
   bundle               Nesneleri ve başvuruları arşive göre taşı
   checkout             Dal değiştir veya çalışma ağacını eski haline geri getir
   cherry-pick          Mevcut bazı işlemelerin getirdiği değişiklikleri uygula
   citool               git-commit için grafik tabanlı alternatif
   clean                İzlenmeyen dosyaları çalışma ağacından kaldır
   clone                Bir depoyu yeni bir dizine klonla
   commit               Değişikliklerin kaydını depoya yaz
   describe             Uygun bir başvuruyu temel alıp nesneye okunabilir ad ver
   diff                 İşlemeler, işleme ve ağaçlar vb. arası değişiklikler
   fetch                Başka bir depodan nesneleri ve başvuruları indir
   format-patch         E-posta teslimi için yamaları hazırla
   gc                   Gereksiz dosyaları temizle ve yerel depoyu eniyile
   gitk                 Git depo tarayıcısı
   grep                 Bir dizgi ile eşleşen satırları yazdır
   gui                  Git için taşınabilir bir grafik arabirim
   init                 Boş bir Git deposu oluştur veya olanı yeniden ilklendir
   log                  İşleme günlüklerini göster
   maintenance          Git depo verisini eniyilemek için görevler çalıştır
   merge                İki veya daha fazla geliştirme geçmişini birleştir
   mv                   Dosya, dizin veya sembolik bağları taşı/yeniden adlandır
   notes                Nesne notları ekle veya incele
   pull                 Başka bir depo veya yerel daldan getir ve entegre et
   push                 İlişkin nesnelerle birlikte uzak başvuruları da güncelle
   range-diff           İki işleme erimini karşılaştır (bir dalın iki sürümü)
   rebase               İşlemeleri başka bir temel ucu üzerine uygula
   reset                Geçerli HEAD'i belirtilen duruma sıfırla
   restore              Çalışma ağacı dosyalarını eski durumuna getir
   revert               Bazı var olan işlemeleri geri al
   rm                   Dosyaları çalışma ağacından ve indeksten kaldır
   shortlog             'git log' çıktısını özetle
   show                 Çeşitli türlerden nesneleri göster
   sparse-checkout      Aralıklı çıkışı ilklendir ve güncelle
   stash                Kirli bir çalışma dizinindeki değişiklikleri zulala
   status               Çalışma ağacı durumunu göster
   submodule            Altmodülleri ilklendir, güncelle veya incele
   switch               Dal değiştir
   tag                  GPG imzalı bir etiket oluştur, sil, listele veya doğrula
   worktree             Birden çok çalışma ağacını yönet

Yan Komutlar / Yönlendiriciler
   config               Depoyu veya global seçenekleri al ve ayarla
   fast-export          Git veri dışa aktarıcısı
   fast-import          Hızlı Git veri dışa aktarıcıları için arka uç
   filter-branch        Dalları yeniden yaz
   mergetool            Çakışmaları çözmek için çözüm araçlarını çalıştır
   pack-refs            Etkili depo erişimi için dal uçları ve etiketler paketle
   prune                Ulaşılamayan tüm nesneleri nesne veritabanından buda
   reflog               Başvuru günlüğü bilgisini yönet
   remote               İzlenen depolar setini yönet
   repack               Bir depodaki paketlenmemiş nesneleri paketle
   replace              Nesne değiştirmek için başvurular oluştur, sil, listele

Yan Komutlar / Sorgucular
   annotate             İşleme bilgisini dosya içi açıklama olarak ekle
   blame                Dosya satırlarını son değiştiren revizyon/yazarı göster
   bugreport            Hata raporu bildirimi için veri topla
   count-objects        Açılmamış nesne sayısını ve disk kullanımını hesapla
   difftool             Değişiklikleri yaygın diff araçlarıyla göster
   fsck                 Veritab. nesnelerin bağlanırlığını ve geçerliliğini sına
   gitweb               Git web arabirimi (Git depoları için web ön ucu)
   help                 Git yardım bilgisini görüntüle
   instaweb             gitweb'deki çalışma deposuna anında göz at
   merge-tree           İndekse dokunmadan üçlü birleştirmeyi göster
   rerere               Çakışan birleştirmelerin kayıtlı çözümlerini yen. kullan
   show-branch          Dalları ve onların işlemelerini göster
   verify-commit        İşlemelerin GPG imzasını denetle
   verify-tag           Etiketlerin GPG imzasını doğrula
   whatchanged          Günlükleri her işlemenin sunduğu değişikliklerle göster

Başkaları ile Etkileşim
   archimport           Git'e bir GNU Arch deposu içe aktar
   cvsexportcommit      Bir CVS çıkışına tek bir işlemeyi dışa aktar
   cvsimport            'Tiskindiğiniz' başka bir KDY'den verileri kurtar
   cvsserver            Git için bir SCV sunucusu öykünücüsü
   imap-send            stdin'den bir IMAP klasörüne bir yama derlemesi gönder
   p4                   Perforce depolarından içe aktar ve onlara gönder
   quiltimport          Geçerli dala bir "Quilt" yama seti uygula
   request-pull         Bekleyen değişikliklerin bir özetini çıkart
   send-email           Bir yama derlemesini e-posta olarak gönder
   svn                  Bir Subversion ve Git deposu arasında iki yönlü işlemler

Düşük Düzeyli Komutlar / Yönlendiriciler
   apply                İndekse ve/veya dosyalara bir yama uygula
   checkout-index       Dosyaları indeksten çalışma ağacına kopyala
   commit-graph         Git commit-graph dosyalarını doğrula ve yaz
   commit-tree          Yeni bir işleme nesnesi oluştur
   hash-object          Sağlamayı hesapla ve isteğe göre dosyadan ikili oluştur
   index-pack           Mevcut paketli bir arşiv için paket indeks dosyası yap
   merge-file           Bir 3 yönlü dosya birleştirmesi çalıştır
   merge-index          Birleştirilmesi gereken dosyaları birleştir
   mktag                Ek doğrulamalı bir etiket nesnesi oluştur
   mktree               ls-tree biçimli metinden bir ağaç nesnesi yap
   multi-pack-index     multi-pack-index doğrula ve yaz
   pack-objects         Paketlenmiş bir nesne arşivi oluştur
   prune-packed         Halihazırda paket dosyalarında olan ek nesneleri kaldır
   read-tree            Ağaç bilgisini indekse okur
   symbolic-ref         Sembolik başvuruları oku, düzenle ve sil
   unpack-objects       Paketlenmiş bir arşivden nesneleri çıkar
   update-index         Çalışma ağacındaki dosya içeriğini indekse kaydet
   update-ref           Güvenlice bir başvuruda depolanan nesne adını güncelle
   write-tree           Geçerli indeksten bir ağaç nesnesi oluştur

Düşük Düzeyli Komutlar / Sorgucular
   cat-file             Depo nesneleri için içerik veya tür/boyut bilgisi sağla
   cherry               Henüz üstkaynağa uygulanmayan işlemeleri bul
   diff-files           İndeksteki ve çalışma ağacındaki dosyaları sıkıştır
   diff-index           Bir ağacı çalışma ağacı veya indeks ile karşılaştır
   diff-tree            İki ağaç nesnesi aracılığıyla bulunan ikililerin içerik ve kipini karşılaştır
   for-each-ref         Her başvuru üzerine bilgi çıktı ver
   for-each-repo        Listedeki depolar üzerinde bir Git komutu çalıştır
   get-tar-commit-id    İşleme iletisini bir git-archive arşivinden çıkartıp al
   ls-files             İndeks ve çalışma ağacındaki dosya bilgilerini göster
   ls-remote            Uzak bir depodaki başvuruları listele
   ls-tree              Bir ağaç nesnesinin içeriğini listele
   merge-base           Birleştirme için olabildiğince en iyi ortak ataları bul
   name-rev             Verilen revizyonlar için sembolik adları bul
   pack-redundant       Gereksiz paket dosyalarını bul
   rev-list             İşleme nesnelerini ters kronolojik sırada listele
   rev-parse            Parametreleri al ve üzerinde çalış
   show-index           Paketlenmiş arşiv indeksini göster
   show-ref             Yerel bir depodaki başvuruları listele
   unpack-file          Bir ikili nesnenin içeriği ile geçici bir dosya oluştur
   var                  Bir mantıksal Git değişkeni göster
   verify-pack          Paketlenmiş Git arşiv dosyalarını doğrula

Düşük Düzeyli Komutlar / Depo Eşitleme
   daemon               Git depoları için gerçekten yalın bir sunucu
   fetch-pack           Başka bir depodan eksik nesneleri al
   http-backend         Git'in HTTP üzerinden sunucu tarafı uygulaması
   send-pack            Nesneleri Git protokolü üzerinden başka bir depoya it
   update-server-info   Programlanamayan sunuculara destek için yardımcı veri dosyasını güncelle

Düşük Düzeyli Komutlar / İç Yardımcılar
   check-attr           gitattributes bilgisini görüntüle
   check-ignore         gitignore / exclude dosyalarında hata ayıkla
   check-mailmap        Kişilerin adlarını ve e-posta adreslerini göster
   check-ref-format     Bir başvuru adının düzgünce oluşturulduğundan emin ol
   column               Verileri sütunlarla göster
   credential           Kullanıcı yetkilerini al ve depola
   credential-cache     Parolaları geçici olarak bellekte saklamak için yardımcı
   credential-store     Yetkileri diskte saklamak için yardımcı
   fmt-merge-msg        Bir birleştirme işlemesi iletisi oluştur
   interpret-trailers   İşleme iletilerine düzenli bilgi ekle veya ayrıştır
   mailinfo             E-posta iletisinden yama ve yazar bilgisini çıkart
   mailsplit            Yalın UNIX mbox bölücü yazılımı
   merge-one-file       Bu yardımcı program git-merge-index kullanımı içindir
   patch-id             Bir yama için eşi olmayan numara hesapla
   sh-i18n              Kabuk betikleri için Git'in i18n kurulum kodu
   sh-setup             Ortak Git kabuk betiği kurulum kodu
   stripspace           Gereksiz boşlukları kaldır

Dış komutlar
   clang-format
