worker_processes 2
working_directory "/home/anime/en_word_h1/current" #appと同じ階層を指定

timeout 3600


listen "/var/run/unicorn/en_word_h1.sock"
pid "/var/run/unicorn/en_word_h1.pid"


stderr_path "/home/anime/town/current/log/unicorn.log"
stdout_path "/home/anime/town/current/log/unicorn.log"


preload_app true